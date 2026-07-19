import subprocess
import re

# Get the full correct file from commit 38f2ada (before corruption)
out = subprocess.check_output(['git', 'show', '38f2ada:src/main/webapp/bookingHistoryDetail.jsp'])
full_content = out.decode('utf-8')

# Extract Columns
def extract_column(content, col_num):
    start_marker = f'<!-- Column {col_num}:'
    start_idx = content.find(start_marker)
    if start_idx == -1:
        print(f'Cannot find Column {col_num}')
        return ''
    # Find the next <!-- Column or <!-- Mini Extension Info Link --> or closing of grid.
    # Column ends where the next column starts or the grid ends.
    next_col_idx = content.find('<!-- Column', start_idx + 1)
    mini_idx = content.find('<!-- Mini Extension Info Link -->', start_idx)
    
    end_idx = len(content)
    if next_col_idx != -1 and next_col_idx < end_idx:
        end_idx = next_col_idx
    if mini_idx != -1 and mini_idx < end_idx:
        end_idx = mini_idx
        
    col = content[start_idx:end_idx]
    # We need to strip the last closing div if it belongs to the grid? No, the column is closed within itself.
    # Let's just slice it up to the next marker and rstrip()
    # Actually, Column 3 might include the closing div of the grid if we just slice up to mini_ext_idx.
    if col_num == 3:
        # Grid close is before mini_ext_idx
        grid_close = col.rfind('</div>')
        col = col[:grid_close]
    
    return col.strip()

col1 = extract_column(full_content, 1)
col2 = extract_column(full_content, 2)
col3 = extract_column(full_content, 3)

# Extract the GPS block from the CURRENT HEAD (where I had put it)
current_head = subprocess.check_output(['git', 'show', 'HEAD:src/main/webapp/bookingHistoryDetail.jsp']).decode('utf-8')
gps_pattern = re.compile(r'<c:if test="\$\{false\}">\s*(<!-- GPS DEMO BLOCK -->.*?</script>)\s*</c:if>', re.DOTALL)
match = gps_pattern.search(current_head)
if match:
    gps_content = match.group(1)
    # Remove the '(Bản Demo)' text if it exists
    gps_content = gps_content.replace('Trình theo dõi GPS (Bản Demo)', 'Trình theo dõi GPS')
else:
    gps_pattern2 = re.compile(r'<!-- GPS DEMO BLOCK -->.*?</script>', re.DOTALL)
    match2 = gps_pattern2.search(current_head)
    gps_content = match2.group(0) if match2 else ''

col4_gps = f'''<!-- Column 4: Định vị GPS -->
                            <div class="flex flex-col h-full">
                                <div class="bg-white border border-gray-100 shadow-sm rounded-2xl p-6 relative overflow-hidden flex-1">
{gps_content}
                                </div>
                            </div>'''

# Now construct the final file.
# We take full_content, and replace the entire Grid with our new 4 columns.
# Find grid start and end in full_content.
grid_start = full_content.find('<div class="grid grid-cols-1 lg:grid-cols-')
mini_idx = full_content.find('<!-- Mini Extension Info Link -->')
grid_end = full_content.rfind('</div>', 0, mini_idx) + 6 # Include the </div>

# We want 2x2 grid: Top: Lịch trình (Col1) & GPS (Col4). Bottom: Chi tiết (Col2) & Thanh toán (Col3)
# Or just put them in DOM order 1,4,2,3 inside grid-cols-2
new_grid = f'''<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-6">
                            {col1}
                            {col4_gps}
                            {col2}
                            {col3}
                        </div>'''

final_content = full_content[:grid_start] + new_grid + full_content[grid_end:]

# Add Chat JS fix
chat_js_pattern = re.compile(r'(function loadChatMessages\(\) \{.*?)(\s*let container = \$\(.*?;)(.*?\.html\(html\);)(.*?\}\))', re.DOTALL)
chat_js_replacement = r'''\1\2
                if (window.lastChatHtml !== html) {
                    window.lastChatHtml = html;
                    \3\4
                }'''
final_content = chat_js_pattern.sub(chat_js_replacement, final_content)

with open('src/main/webapp/bookingHistoryDetail.jsp', 'w', encoding='utf-8') as f:
    f.write(final_content)
print('Fixed JSP!')
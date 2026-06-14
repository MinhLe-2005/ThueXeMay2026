with open('src/main/webapp/booking.jsp', 'r', encoding='utf-8') as f:
    lines = f.readlines()

cleaned_lines = []
skip = False
for line in lines:
    if '<div style="margin-top: 8px; display: flex; flex-direction: column; gap: 4px; align-items: flex-end;">' in line:
        skip = True
    if not skip:
        cleaned_lines.append(line)
    if skip and '</div>' in line:
        skip = False

with open('src/main/webapp/booking.jsp', 'w', encoding='utf-8') as f:
    f.writelines(cleaned_lines)

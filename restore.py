import json
import re
import sys

transcript_path = r"C:\Users\Le Quang Minh\.gemini\antigravity\brain\4726cebf-1bd0-4890-841f-7756b034baf2\.system_generated\logs\transcript.jsonl"
out_path = r"d:\A_JAVA_Ki_5\SWP391\motor-booking\motorcycle-booking-system-main\src\main\webapp\bookingHistoryDetail.jsp"

best_content = ""

with open(transcript_path, 'r', encoding='utf-8') as f:
    for line in f:
        try:
            obj = json.loads(line)
            if obj.get("type") == "VIEW_FILE":
                content = obj.get("content", "")
                if "File Path: `file:///D:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/src/main/webapp/bookingHistoryDetail.jsp`" in content:
                    idx = content.find("The following code has been modified to include a line number")
                    if idx != -1:
                        start_idx = content.find("\n", idx) + 1
                        end_idx = content.find("The above content shows the entire, complete file contents", start_idx)
                        if end_idx != -1:
                            raw_lines = content[start_idx:end_idx].split("\n")
                            clean_lines = []
                            for rl in raw_lines:
                                clean_line = re.sub(r'^\d+:\s', '', rl)
                                clean_lines.append(clean_line)
                            extracted = "\n".join(clean_lines).strip()
                            if len(extracted) > len(best_content):
                                best_content = extracted
        except Exception as e:
            pass

if best_content:
    with open(out_path, 'w', encoding='utf-8') as f:
        f.write(best_content)
    print(f"Successfully restored bookingHistoryDetail.jsp ({len(best_content)} bytes)")
else:
    print("Could not find the content in the transcript.")

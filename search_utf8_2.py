import os
import glob

def search_text(path, text):
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith('.jsp') or file.endswith('.js') or file.endswith('.html'):
                filepath = os.path.join(root, file)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        lines = f.readlines()
                        for i, line in enumerate(lines):
                            if text in line:
                                print(f"Found in {filepath} (Line {i+1}): {line.strip()}")
                except:
                    pass

search_text("d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/src/main/webapp", "Vui l")

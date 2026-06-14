import os
import glob

def search_text(path, text):
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith('.jsp') or file.endswith('.js') or file.endswith('.html'):
                filepath = os.path.join(root, file)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()
                        if text in content:
                            print(f"Found in {filepath}")
                except Exception as e:
                    try:
                        with open(filepath, 'r', encoding='windows-1252') as f:
                            content = f.read()
                            if text in content:
                                print(f"Found in {filepath} (1252)")
                    except:
                        pass

search_text("d:/A_JAVA_Ki_5/SWP391/motor-booking/motorcycle-booking-system-main/src/main/webapp", "1 ti")

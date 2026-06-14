import os

scripts = [
    "update_past.py",
    "update_data_price.py",
    "update_js_calc.py",
    "update_ui_step5.py",
    "update_js_total.py",
    "update_vnpay.py",
    "remove_rule.py",
    "remove_package_text.py",
    "update_ui_tweaks.py",
    "update_elegant_badges.py",
    "fix_accessory_price.py"
]

for s in scripts:
    with open(s, "r", encoding="utf-8") as f:
        content = f.read()
    
    if content.startswith('\ufeff'):
        content = content[1:]
    
    # Try to fix strings that were saved with ANSI
    try:
        raw = content.encode('cp437')
        fixed = raw.decode('utf-8')
        with open(s, "w", encoding="utf-8", newline='\n') as f:
            f.write(fixed)
        print("Fixed", s)
    except Exception as e:
        print("Could not fix", s, e)
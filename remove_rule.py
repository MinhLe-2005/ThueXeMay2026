import os

def remove_min_advance(filepath):
    if not os.path.exists(filepath): return
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove the rule from pickuptime
    content = content.replace("minAdvanceTime: true", "")
    content = content.replace(",\n                              \n", "\n") # clean up comma if trailing
    
    # Let's just find the addMethod block and comment it out or remove it
    # We can just leave the addMethod there if it's not used, it won't hurt, but let's remove it if possible.
    # Actually, simpler is to just remove minAdvanceTime: true from the rules object.
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)
    print(f"Removed minAdvanceTime rule from {filepath}")

remove_min_advance("src/main/webapp/booking.jsp")
remove_min_advance("src/main/webapp/extendBooking.jsp")

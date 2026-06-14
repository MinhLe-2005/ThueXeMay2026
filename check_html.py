import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

print("Form id exists:", 'id="booking-form"' in content)
print("Form start exists:", '<form' in content)
print("Form end exists:", '</form>' in content)
print("Wizard id exists:", 'id="wizard"' in content)
print("Count of function BookingHandler:", content.count("function BookingHandler"))
print("Is BookingHandler syntax correct?")
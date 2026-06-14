import re

with open("src/main/webapp/booking.jsp", "r", encoding="utf-8") as f:
    content = f.read()

bad_pickup_listener = """                pickupdate.addEventListener('change', () => {
                    const pickupdateValue = new Date(pickupdate.value);
                    pickupdateValue.setDate(pickupdateValue.getDate() + 1); // Minimum return date is one day after pick-up date
                    returndate.min = formatDate(pickupdateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        returndate.value = formatDate(pickupdateValue);
                    }
                });"""

good_pickup_listener = """                pickupdate.addEventListener('change', () => {
                    const pickupdateValue = new Date(pickupdate.value);
                    pickupdateValue.setDate(pickupdateValue.getDate() + 1); // Minimum return date is one day after pick-up date
                    returndate.min = formatDate(pickupdateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.value)) {
                        returndate.value = formatDate(pickupdateValue);
                        // Update max of pickupdate based on new returndate
                        const newReturn = new Date(returndate.value);
                        newReturn.setDate(newReturn.getDate() - 1);
                        pickupdate.max = formatDate(newReturn);
                    } else {
                        // Update max of pickupdate based on existing returndate
                        const existingReturn = new Date(returndate.value);
                        existingReturn.setDate(existingReturn.getDate() - 1);
                        pickupdate.max = formatDate(existingReturn);
                    }
                });"""

content = content.replace(bad_pickup_listener, good_pickup_listener)

bad_return_listener = """                returndate.addEventListener('change', () => {
                    const returndateValue = new Date(returndate.value);
                    returndateValue.setDate(returndateValue.getDate() - 1); // Minimum return date is one day after pick-up date
                    pickupdate.max = formatDate(returndateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.min)) {
                        pickupdate.value = formatDate(returndateValue);
                    }
                });"""

good_return_listener = """                returndate.addEventListener('change', () => {
                    const returndateValue = new Date(returndate.value);
                    returndateValue.setDate(returndateValue.getDate() - 1); // Minimum return date is one day after pick-up date
                    pickupdate.max = formatDate(returndateValue);

                    if (new Date(returndate.value) <= new Date(pickupdate.value)) {
                        pickupdate.value = formatDate(returndateValue);
                        // Update min of returndate based on new pickupdate
                        const newPickup = new Date(pickupdate.value);
                        newPickup.setDate(newPickup.getDate() + 1);
                        returndate.min = formatDate(newPickup);
                    }
                });"""

content = content.replace(bad_return_listener, good_return_listener)

with open("src/main/webapp/booking.jsp", "w", encoding="utf-8") as f:
    f.write(content)

    function OneClick(btn) {
        var id = btn.getAttribute('data-motorcycleId');
        var name = btn.getAttribute('data-motorcycleName');
        var license = btn.getAttribute('data-license');

        document.getElementById("modal-motorcycleID").innerHTML = id;
        document.getElementById("modal-motorcycleName").innerHTML = name;

        var str = license.split(",");
        var text = "";
        var count = 0;
        for (var i = 0; i < str.length; i++) {
            if (str[i].trim() !== "") {
                text += "<div style='display: inline-flex; align-items: center; background-color: #f8fafc; border: 1px solid #cbd5e1; border-radius: 6px; padding: 6px 12px; font-weight: 600; color: #334155; box-shadow: 0 1px 2px rgba(0,0,0,0.05);'><i class='fas fa-motorcycle' style='color: #64748b; margin-right: 8px;'></i>" + str[i].trim() + "</div>";
                count++;
            }
        }
        document.getElementById("modal-license").innerHTML = text;
        document.getElementById("modal-license-count").innerHTML = count;
    }

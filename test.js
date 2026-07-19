function openUserModal(button) {
    try {
        var modal = #user-form-modal;
        var bId = button.getAttribute('data-bookingId');
        modal.find('#modal-bookingId').text(bId);
        modal.find('#modal-bookingDate').text(button.getAttribute('data-bookingDate'));
        modal.find('#modal-startDate').text(button.getAttribute('data-startDate'));
        modal.find('#modal-endDate').text(button.getAttribute('data-endDate'));
        
        var sBooking = button.getAttribute('data-statusBooking') || '';
        var dStatus = button.getAttribute('data-deliveryStatus') || '';
        var deliveryLocation = button.getAttribute('data-deliveryLocation') || '';
        
        var sBHtml = sBooking.includes('Ðã xác') ? '<span style=\"color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;\">' + sBooking + '</span>' : '<span style=\"color: #d97706; background: #fffbeb; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #fbbf24;\">' + sBooking + '</span>';
        
        var dSHtml = '';
        if (dStatus.includes('Ðã tr?')) {
            dSHtml = '<span style=\"color: #059669; background: #ecfdf5; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #10b981;\">Ðã tr? xe</span>';
        } else if (dStatus === 'Quá h?n') {
            dSHtml = '<span style=\"color: #dc2626; background: #fef2f2; font-weight: 600; padding: 4px 12px; border-radius: 6px; border: 1px solid #fca5a5;\">Quá h?n</span>';
        } else {
            var isPending = dStatus.includes('Chua giao');
            var isDelivered = dStatus.includes('Ðã giao');
            var selColor = isDelivered ? '#2563eb' : '#475569';
            var selBg = isDelivered ? '#eff6ff' : '#f1f5f9';
            var selBorder = isDelivered ? '#3b82f6' : '#cbd5e1';
            
            var onChangeScript = \"handleDeliveryStatusChange(this, '\" + bId + \"', '\" + deliveryLocation.replace(/'/g, \"\\\\'\") + \"')\";
            
            dSHtml = <select class=\"form-select form-select-sm\" style=\"width: 140px; cursor: pointer; border-radius:6px; font-weight:600; color: \; background: \; border: 1px solid \;\" onchange=\"\\">
                        <option value=\"Chua giao\" \>Ch? nh?n xe</option>
                        <option value=\"Ðã giao\" \>Ðang thuê</option>
                        <option value=\"Ðã tr?\">Ðã tr? xe</option>
                      </select>;
        }
        
        modal.find('#modal-statusBooking').html(sBHtml);
        modal.find('#modal-deliveryLocation').text(button.getAttribute('data-deliveryLocation'));
        modal.find('#modal-returnedLocation').text(button.getAttribute('data-returnedLocation'));
        modal.find('#modal-deliveryStatus').html(dSHtml);
        modal.find('#modal-countMotorcycle').text(button.getAttribute('data-countMotorcycle'));
        modal.find('#modal-nameMotorcycle').html(button.getAttribute('data-nameMotorcycle'));
        modal.find('#modal-Price').text(button.getAttribute('data-Price'));
        modal.find('#modal-customerId').attr('data-cusName', button.getAttribute('data-cusName'));
        modal.find('#modal-customerId').attr('data-cusPhone', button.getAttribute('data-cusPhone'));
        modal.find('#modal-customerId').attr('data-cusEmail', button.getAttribute('data-cusEmail'));
        modal.find('#modal-customerId').attr('data-cusIdCard', button.getAttribute('data-cusIdCard'));
        modal.find('#modal-customerId').attr('data-identityCard', button.getAttribute('data-identityCard'));
        modal.find('#modal-customerId').attr('data-issuedOn', button.getAttribute('data-issuedOn'));
        modal.find('#modal-customerId').attr('data-expDate', button.getAttribute('data-expDate'));
        modal.find('#modal-customerId').attr('data-typeCard', button.getAttribute('data-typeCard'));
        modal.find('#modal-cusId').text(button.getAttribute('data-cusId'));

        var statusBooking = modal.find('#modal-statusBooking').text().trim();
        var payStatus = button.getAttribute('data-paymentStatus') || '';
        var payMethod = button.getAttribute('data-paymentMethod') || '';
        var payAmt = button.getAttribute('data-paymentAmount') || '0';
        var hasPaid = payStatus !== '' && !payStatus.includes('Ch?');

        if (payStatus === '') {
            #modal-paymentInfo.html('<span style=\"color:#94a3b8; font-style:italic;\">Chua thanh toán</span>');
        } else if (hasPaid) {
            #modal-paymentInfo.html('<span style=\"color:#059669; background:#ecfdf5; padding:2px 10px; border-radius:6px; border:1px solid #10b981;\"><i class=\"fas fa-check-circle me-1\"></i>' + payMethod + '</span>');
        } else {
            #modal-paymentInfo.html('<span style=\"color:#d97706; background:#fffbeb; padding:2px 10px; border-radius:6px; border:1px solid #fbbf24;\">' + payStatus + '</span>');
        }

        if (sBooking.includes('Ch')) {
            #confirmwait.show();
            #confirmyes.hide();
        } else {
            #confirmwait.hide();
            #confirmyes.show();
            if (hasPaid) {
                #approveInvoiceArea.hide();
                #paidInvoiceArea.show();
                #paidInvoiceLabel.text('Ðã thanh toán (' + payMethod + ')');
            } else {
                #approveInvoiceArea.show();
                #paidInvoiceArea.hide();
            }

            var selectElement = button.closest('tr').querySelector('select[name^=\"delistatus_\"]');
            var deliveryStatus = selectElement ? selectElement.value : button.getAttribute('data-deliveryStatus');
            if (deliveryStatus === 'Chua giao') {
                #handoverArea.show();
            } else {
                #handoverArea.hide();
            }
        }

        modal.modal('show');
    } catch (err) {
        // ...
    }
}


    function openEditModal(btn) {
        var id = btn.getAttribute('data-id');
        var model = btn.getAttribute('data-model');
        var image = btn.getAttribute('data-image');
        var displacement = btn.getAttribute('data-displacement');
        var description = btn.getAttribute('data-desc');
        var minAge = btn.getAttribute('data-age');
        var bid = btn.getAttribute('data-bid');
        var cid = btn.getAttribute('data-cid');
        var pid = btn.getAttribute('data-pid');

        document.getElementById('modal-update-id').value = id;
        document.getElementById('modal-update-model').value = model;
        document.getElementById('modal-update-displacement').value = displacement;
        document.getElementById('modal-update-description').value = description;
        document.getElementById('modal-update-minAge').value = minAge;
        document.getElementById('modal-update-bid').value = bid;
        document.getElementById('modal-update-cid').value = cid;
        document.getElementById('modal-update-pid').value = pid;
        document.getElementById('modal-update-image-removed').value = "false";
        document.getElementById('modal-update-image').value = ""; // clear file input

        var imgContainer = document.getElementById('modal-update-image-preview');
        imgContainer.innerHTML = '';
        if (image && image !== 'null' && image !== '') {
            var imgSrc = image.startsWith('http') ? image : 'images/' + image;
            imgContainer.innerHTML = '<div style="position: relative; display: inline-block;">' +
                '<img src="' + imgSrc + '" class="img-fluid img-thumbnail" style="max-height: 150px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);" alt="Preview">' +
                '<button type="button" onclick="removeUpdateImage()" style="position: absolute; top: 5px; right: 5px; background: #ef4444; color: white; border: none; border-radius: 50%; width: 28px; height: 28px; display: flex; align-items: center; justify-content: center; cursor: pointer; box-shadow: 0 2px 4px rgba(0,0,0,0.2); font-size: 18px; line-height: 1;">&times;</button>' +
                '</div>';
        } else {
            imgContainer.innerHTML = '<span class="text-muted">No image available</span>';
        }

        $('#updateMotorbikeModal').modal('show');
    }

    function removeUpdateImage() {
        var imgContainer = document.getElementById('modal-update-image-preview');
        imgContainer.innerHTML = '<span class="text-muted">Hình ảnh đã bị xóa. Vui lòng chọn ảnh mới.</span>';
        document.getElementById('modal-update-image-removed').value = "true";
        document.getElementById('modal-update-image').value = "";
    }

    function previewUpdateImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var imgContainer = document.getElementById('modal-update-image-preview');
            imgContainer.innerHTML = '<div style="position: relative; display: inline-block;">' +
                '<img src="' + reader.result + '" class="img-fluid img-thumbnail" style="max-height: 150px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1);" alt="Preview">' +
                '<button type="button" onclick="removeUpdateImage()" style="position: absolute; top: 5px; right: 5px; background: #ef4444; color: white; border: none; border-radius: 50%; width: 28px; height: 28px; display: flex; align-items: center; justify-content: center; cursor: pointer; box-shadow: 0 2px 4px rgba(0,0,0,0.2); font-size: 18px; line-height: 1;">&times;</button>' +
                '</div>';
            document.getElementById('modal-update-image-removed').value = "false";
        };
        if(event.target.files[0]){
            reader.readAsDataURL(event.target.files[0]);
        }
    }

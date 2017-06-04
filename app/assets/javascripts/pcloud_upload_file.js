$(document).on('change', '#song_upload_to_pcloud', function() {
  var selected_album_id = $("#song_album_id").val();
  get_album_folder_id(selected_album_id, this);
});

function get_album_folder_id(album_id, file) {
  $.ajax({
    url: "/albums/fetch_folder_id",
    type: "get", //send it through get method
    data: {
      album_id: album_id
    },
    success: function(response) {
      upload_to_pcloud(response.folder_id, file)
    },
    error: function(xhr) {
      console.log("Error fetching folder id");
    }
  });
}

function upload_to_pcloud(folder_id, file) {
  pCloudSdk.createClient('XEfdZ0vtAVEqVk00ZAiLc67Zs3NBtTeHaWyOUxKzVh1QEfAfpfFk').upload(file.files[0], folder_id, {
    onBegin: () => {
      console.log('started');
      $('<div id="myProgress"><div id="myBar" class="input"></div></div>').insertAfter($("#song_upload_to_pcloud"));
    },
    onProgress: function(progress) {
      console.log(progress.loaded, progress.total);
      var elem = document.getElementById("myBar");
      var width = 1;
      elem.style.width = Math.ceil(progress.loaded / progress.total * 100) + '%';
    },
    onFinish: function(fileMetadata) {
      $('#song_name').val(fileMetadata.metadata.name.split('.')[0]);
      $('#song_file_name').val(fileMetadata.metadata.name);
      $('#song_pcloud_file_no').val(fileMetadata.metadata.fileid);
      alert("File uploaded to Pcloud.");
    }
  }).catch(function(error) {
    console.error(error);
  });
}

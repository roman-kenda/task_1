/*$(function (){
	Dropzone.autoDiscover = false;

	$("#my-dropzone").dropzone({
		maxFilesize: 5,
		addRemoveLinks: true,
		paramName: 'picture.image_url',
		success: function(file, response){
			$(file.previewElement).find(.dz-remove).attr('id', response.imageId);
			$(file.previewElement).addClass('dz-succsess');
		}
	})
})

$(document).ready(function(){
	// disable auto discover
	Dropzone.autoDiscover = false;
 

	var dropzone = new Dropzone (".dropzone", {
		maxFilesize: 256, // Set the maximum file size to 256 MB
		paramName: "image", // Rails expects the file upload to be something like model[field_name]
		addRemoveLinks: true // Don't show remove links on dropzone itself.
	});	

	dropzone.on("success", function(file) {
		this.removeFile(file)
		$.getScript("/images")
	})
});*/
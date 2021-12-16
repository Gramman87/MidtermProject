
// enter/return key behavior on invite input
$("#invite-input").on("keydown", function(e) {
	if (e.keyCode === 13) {
		e.preventDefault();
		addInvitee();
	}
});

function addInvitee() {
	var value = $("#invite-input").val();

	if (value.length === 0) {
		return;
	}
	var formValue = $(document.createElement("input"));
	formValue.attr("type", "hidden");
	formValue.attr("name", "invites[]");
	formValue.attr("value", value);
	$("#invites-form").append(formValue);

	var previewValue = $(document.createElement("div"));
	previewValue.addClass("invitee");
	previewValue.text(value);
	previewValue.data("formValue", formValue);
	previewValue.on("click", function() {
		$(this).data("formValue").remove();
		$(this).remove();
	});
	$("#invites-preview").append(previewValue);
	$("#invite-input").val("");
}
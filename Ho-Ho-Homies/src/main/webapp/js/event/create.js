
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
	
	addInviteeValue(value)
}

function addInviteeValue(value) {
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

if (typeof prefetch !== 'undefined') {
	prefetch.forEach((e) => { addInviteeValue(e); })
}

if (typeof beginsOn !== 'undefined') {
	$("body > div > div:nth-child(3) > div.col-8 > div:nth-child(4) > div.col > input").val(beginsOn);
}

if (typeof rsvpBy !== 'undefined') {
	$("body > div > div:nth-child(3) > div.col-8 > div:nth-child(5) > div.col > input").val(rsvpBy);
}
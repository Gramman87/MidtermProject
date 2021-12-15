<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body>

	<form id="create" method="POST">
		<div>
			<label>Title: <input name="title" /></label>
		</div>

		<div>
			<label>Type of Exchange <select name="type.name">
					<option>Secret Santa</option>
					<option>White Elephant</option>
					<option>Potluck</option>
					<option>Custom</option>
			</select></label>
		</div>

		<div>
			<label>Custom Rules: <input name="type.description" size="4" /></label>
		</div>

		<div>
			<label>Image (URL): <input name="imageURL" /></label>
		</div>

		<div>
			<label>Begins on: <input name="beginsOn"
				type="datetime-local" /></label>
		</div>
		<div>
			<label>RSVP by: <input name="rsvpBy" type="date" /></label>
		</div>

		<div>
			<p>Location</p>
			<div>
				<label>Street: <input name="address.street1" /></label>
			</div>
			<div>
				<label>Street 2: <input name="address.street2" /></label>
			</div>
			<div>
				<label>State: <input name="address.state" /></label>
			</div>
			<div>
				<label>City: <input name="address.city" /></label>
			</div>
			<div>
				<label>Zipcode: <input name="address.zipcode" /></label>
			</div>
		</div>

		<div id="invites-form" style="display: none"></div>
	</form>

	<div id="invites-preview">
		<p>Invites</p>
		<div>
			<input id="invite-input" type="text" />
			<button onclick="addInvitee()">Add</button>
		</div>

		<script>
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
		</script>
	</div>

	<div>
		<input type="submit" form="create" />
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
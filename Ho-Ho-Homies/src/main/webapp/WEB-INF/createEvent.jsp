<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
.invitee:hover {
	text-decoration: line-through;
	cursor: pointer;
}
</style>
</head>
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
			<label>RSVP by: <input name="beginsOn" type="datetime-local" /></label>
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
		<div>
			<input id="invite-input" type="text" />
			<button onclick="addInvitee()">Add</button>
		</div>

		<script>
			function addInvitee() {
				var value = $("#invite-input").val();
				$("#invite-input").val("");

				if (!value || value.length === 0) {
					return;
				}

				$("#invites-form").append(
				$(document.createElement("input"))
				.attr("type", "hidden")
				.attr("name", "invites[]")
				.attr("value", value)
				);

				var e = $(document.createElement("div"));
				e.addClass("invitee");
				e.text(value);

				e.on("click", function() {
					// remove value from form
					for (var child of $("#invites-form").children().toArray()) {
						child = $(child);
						
						if (child.attr("value") === value) {
							child.remove();
							break;
						}
					}

					// remove preview value
					$(this).remove();
				});

				$("#invites-preview").append(e);
			}
		</script>
	</div>

	<div>
		<input type="submit" form="create" />
	</div>
</body>
</html>
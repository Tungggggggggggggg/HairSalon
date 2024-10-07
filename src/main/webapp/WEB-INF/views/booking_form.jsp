<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>
</head>
<body>
<h1>Booking Form</h1>
<form action="/booking" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>

    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" required><br><br>

    <label for="service">Service:</label>
    <input type="text" id="service" name="service" required><br><br>

    <button type="submit">Submit</button>
</form>
</body>
</html>

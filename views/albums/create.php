<h1>Create new album</h1>
<form action="/albums/create" method="POST">
    <label for="album-title">Title:</label>
    <input type="text" placeholder="Title:" />
    <input type="file" name="images[]" id="images" multiple>

    <input type="submit" value="Create" />
</form>
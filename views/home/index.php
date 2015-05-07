<h1>Welcome to Home!</h1>
<a href="account/login">Login</a>
<a href="account/register">Register</a>

<button id="show-books-btn">Show books</button>
<div id="books"></div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
    $('#show-books-btn').on('click', function(evt) {
        $.ajax({
            url: '/books/show-books',
            method: 'GET'
        }).success(function(data) {
            $('#books').html(data);
            $(evt.target).hide();
        }).error(function (data) {
            debugger;
        });
    });
</script>
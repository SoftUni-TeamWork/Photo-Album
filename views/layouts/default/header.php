<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/content/styles.css"/>
    <title>
        <?php if (isset($this->title)) echo htmlspecialchars($this->title) ?>
    </title>
</head>

<body>
<header>
    <!--<a href="/"><img src="/content/images/site-logo.png"></a>-->
    <ul>
        <li><a href="/">Home</a></li>
        <?php if($this->isLoggedIn): ?>
        <li><a href="/albums/me">My albums</a></li>
        <!--<li><a href="/books">Books</a></li>-->
        <?php endif; ?>
    </ul>

    <?php if ($this->isLoggedIn): ?>
        <div id="logged-in-info">
            <span>Hello, <?= htmlspecialchars($_SESSION['username']) ?></span>
            <form action="/account/logout" method="POST">
                <input type="submit" value="Logout"/>
            </form>
        </div>
    <?php endif; ?>
</header>

<?php include('messages.php'); ?>

<ul>
    <?php foreach ($this->books as $book): ?>
        <li><?= htmlspecialchars($book['title']) ?></li>
    <?php endforeach; ?>
</ul>
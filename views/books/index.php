<h1>Books</h1>
<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
    </tr>
    <?php foreach($this->books as $book): ?>
        <tr>
            <td><?= htmlspecialchars($book['id']) ?></td>
            <td><?= htmlspecialchars($book['title']) ?></td>
        </tr>
    <?php endforeach; ?>
</table>
<a href="/books/index/<?= $this->page - 1 ?>/<?= $this->pageSize ?>">Previous</a>
<a href="/books/index/<?= $this->page + 1 ?>/<?= $this->pageSize ?>">Next</a>
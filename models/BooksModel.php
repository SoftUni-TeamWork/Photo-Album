<?php

class BooksModel extends BaseModel {
    public function getAll() {
        $statement = self::$db->query('SELECT id, title FROM books');
        return $statement->fetch_all(MYSQLI_ASSOC);
    }

    public function getFilteredBooks($from, $size) {
        $statement = self::$db->prepare('SELECT id, title FROM books LIMIT ?, ?');
        $statement->bind_param('ii', $from, $size);
        $statement->execute();
        $result = $statement->get_result()->fetch_all(MYSQLI_ASSOC);

        return $result;
    }
}
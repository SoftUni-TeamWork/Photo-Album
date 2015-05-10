<?php

class AlbumsModel extends BaseModel {
    public function getUserAlbumsFiltered($username, $page, $pageSize) {
        $statement = self::$db->prepare('SELECT SQL_CALC_FOUND_ROWS a.id, a.name, u.username as author, a.date_created, a.rating
                                        FROM albums as a
                                        INNER JOIN users as u
                                        ON a.user_id = u.id
                                        WHERE u.username = ? LIMIT ?, ?');
        $statement->bind_param('sii', $username, $page, $pageSize);
        $statement->execute();
        $result = $statement->get_result();

        return [
            'fetched_albums' => $result->fetch_all(MYSQLI_ASSOC),
            'total_albums' => self::$db->query('SELECT FOUND_ROWS()')->fetch_row()[0]
        ];
    }

    public function createUserAlbum($username, $name, $photosPaths) {
        $userStatement = self::$db->prepare('SELECT id FROM users WHERE username = ?');
        $userStatement->bind_param('s', $username);
        $userStatement->execute();
        $userResult = $userStatement->get_result();
        $userId = $userResult->fetch_all(MYSQLI_ASSOC)[0]['id'];

        $createAlbumStatement = self::$db->prepare('INSERT INTO albums (name, user_id) VALUES (?, ?)');
        $createAlbumStatement->bind_param('si', $name,$userId);
        $createAlbumStatement->execute();
    }
}
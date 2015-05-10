<?php

class AlbumsModel extends BaseModel {
    public function getUserAlbumsFiltered($username, $page, $pageSize) {
        $statement = self::$db->prepare('SELECT a.id, a.name, u.username as author, a.date_created, a.rating FROM albums as a
                                        INNER JOIN users as u
                                        ON a.user_id = u.id
                                        WHERE u.username = ? LIMIT ?, ?');
        $statement->bind_param('sii', $username, $page, $pageSize);
        $statement->execute();
        $result = $statement->get_result();

        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
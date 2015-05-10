<?php

class AlbumsController extends BaseController {
    private $db;

    public function onInit() {
        $this->title = 'My albums';
        $this->db = new AlbumsModel();
    }

    public function index() {
        
    }

    public function me($page = 0, $pageSize = 10) {
        $this->authorize();
        $this->albums = $this->db->getUserAlbumsFiltered($_SESSION['username'], $page, $pageSize);

        $this->renderView(__FUNCTION__);
    }

    public function showAlbum($albumId) {
        $this->renderView('show-album');
    }

    public function create() {
        $this->authorize();

        $this->renderView(__FUNCTION__);
    }

    public function edit($albumId) {
        $this->authorize();

        $this->renderView(__FUNCTION__);
    }

    public function delete($albumId) {
        $this->authorize();

        $this->renderView(__FUNCTION__);
    }
}
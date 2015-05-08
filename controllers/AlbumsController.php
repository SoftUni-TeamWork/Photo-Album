<?php

class AlbumsController extends BaseController {
    private $db;

    public function onInit() {
        $this->title = 'My albums';
    }

    public function index() {
        
    }

    public function me($page = 0, $pageSize = 10) {

        $this->renderView(__FUNCTION__);
    }

    public function create() {
        $this->renderView(__FUNCTION__);
    }

    public function edit($albumId) {
        $this->renderView(__FUNCTION__);
    }

    public function delete($albumId) {
        $this->renderView(__FUNCTION__);
    }
}
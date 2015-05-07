<?php

class BooksController extends BaseController {
    private $db;

    public function onInit() {
        $this->title = "Books";
        $this->db = new BooksModel();
    }

    public function index($page = 0, $pageSize = 10) {
        $this->authorize();
        $from = $page * $pageSize;
        $this->page = $page;
        $this->pageSize = $pageSize;

        $this->books = $this->db->getFilteredBooks($from, (int)$pageSize);

        $this->renderView();
    }

    public function showBooks(){
        $this->books = $this->db->getAll();
        $this->renderView('show-books', false);
    }
}

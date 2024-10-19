<?= $this->extend("layouts/default") ?>

<?= $this->section('title') ?><?= lang('Home.title') ?><?= $this->endSection() ?>

<?= $this->section("content") ?>

<h1 class="title" style="color: blue; font-size: 48px; font-family: Arial;"><?= lang('Home.welcome') ?></h1>

<?= $this->endSection() ?>
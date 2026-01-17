<?php
namespace OCA\Forum_Widget\Dashboard;

use OCP\Dashboard\IWidget;
use OCP\IL10N;
use OCP\IURLGenerator;
use OCP\AppFramework\Services\IInitialState;

class ForumWidget implements IWidget {
    private IL10N $l;
    private IURLGenerator $url;
    private IInitialState $initialState;

    public function __construct(IL10N $l, IURLGenerator $url, IInitialState $initialState) {
        $this->l = $l;
        $this->url = $url;
        $this->initialState = $initialState;
    }

    public function getId(): string {
        return 'forum_widget';
    }

    public function getTitle(): string {
        return $this->l->t('Forum Übersicht');
    }

    public function getIconClass(): string {
        return 'icon-category-files';
    }

    public function getOrder(): int {
        return 10;
    }

    public function getUrl(): ?string {
        return $this->url->linkToRoute('forum_widget.forum.index');
    }

    public function load(): void {
        \OCP\Util::addStyle('forum_widget', 'dashboard');
        \OCP\Util::addScript('forum_widget', 'dashboard');
        // Daten über InitialState bereitstellen (optional)
        $this->initialState->provideInitialState('forum', 'statsUrl',
            $this->url->linkToRoute('forum_widget.forum.index'));
    }

    public function getTemplateId(): string {
        return 'dashboard.widget'; // 🔥 Nicht 'dashboard'!
    }
}

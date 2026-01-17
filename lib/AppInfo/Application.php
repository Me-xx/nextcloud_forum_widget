<?php

namespace OCA\Forum_Widget\AppInfo;

use OCP\AppFramework\App;
use OCP\AppFramework\Bootstrap\IBootstrap;
use OCP\AppFramework\Bootstrap\IRegistrationContext;
use OCP\AppFramework\Bootstrap\IBootContext;
use OCA\Forum_Widget\Dashboard\ForumWidget;

class Application extends App implements IBootstrap {
    public const APP_ID = 'forum_widget';

    public function __construct(array $urlParams = []) {
        parent::__construct(self::APP_ID, $urlParams);
    }

    public function register(IRegistrationContext $context): void {
        // Direkt dein Widget registrieren, keinen Provider
        $context->registerDashboardWidget(ForumWidget::class);
    }

    public function boot(IBootContext $context): void {
    }
}

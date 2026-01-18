<?php
/**
 * @copyright 2026 Moritz
 * @license AGPL-3.0-or-later
 */
namespace OCA\Forum_Widget\Controller;

use OCP\AppFramework\Controller;
use OCP\AppFramework\Http\DataResponse;
use OCP\IRequest;
use OCP\IDBConnection;
use OCP\AppFramework\Http\Attribute\NoAdminRequired;
use OCP\AppFramework\Http\Attribute\NoCSRFRequired;
use Exception;

class ForumController extends Controller {
    private IDBConnection $db;

    public function __construct(string $appName, IRequest $request, IDBConnection $db) {
        parent::__construct($appName, $request);
        $this->db = $db;
    }

    #[NoAdminRequired]
    #[NoCSRFRequired]
    public function index(): DataResponse {
        try {
            // Top Kategorien nach Thread-Anzahl
            $qb = $this->db->getQueryBuilder();

            $qb->select('c.name','c.slug')
                ->addSelect($qb->createFunction('COUNT(t.id) AS thread_count'))
                ->from('forum_categories', 'c')
                ->leftJoin('c', 'forum_threads', 't', 'c.id = t.category_id')
                ->groupBy('c.id', 'c.name','c.slug')
                ->orderBy('thread_count', 'DESC')
                ->setMaxResults(3);

            $categories = $qb->executeQuery()->fetchAll();  // ✅ fetchAll() statt fetchAllAssociative()

            // Top Threads nach Views
            $qb2 = $this->db->getQueryBuilder();
            $qb2->select('title', 'view_count','slug')
                ->from('forum_threads')
                ->orderBy('view_count', 'DESC')
                ->setMaxResults(3);

            $threads = $qb2->executeQuery()->fetchAll();  // ✅ fetchAll() statt fetchAllAssociative()

            return new DataResponse([
                'categories' => $categories,
                'threads' => $threads
            ]);

        } catch (Exception $e) {
            return new DataResponse(['error' => $e->getMessage()], 500);
        }
    }
}

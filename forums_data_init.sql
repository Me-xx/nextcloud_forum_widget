--
-- Daten für Tabelle `oc_forum_bbcodes`
--

INSERT INTO `oc_forum_bbcodes` (`id`, `tag`, `replacement`, `example`, `description`, `enabled`, `parse_inner`, `is_builtin`, `special_handler`, `created_at`) VALUES
(1, 'b', '<strong>{content}</strong>', '[b]Fett[/b]', NULL, 1, 1, 0, NULL, 0),
(2, 'i', '<em>{content}</em>', '[i]Kursiv[/i]', NULL, 1, 1, 0, NULL, 0),
(3, 'u', '<u>{content}</u>', '[u]Unterstrichen[/u]', NULL, 1, 1, 0, NULL, 0),
(4, 's', '<s>{content}</s>', '[s]Durchgestrichen[/s]', NULL, 1, 1, 0, NULL, 0),
(5, 'url', '<a href=\"{option}\">{content}</a>', '[url=https://example.com]Link[/url]', NULL, 1, 1, 0, NULL, 0),
(6, 'img', '<img src=\"{content}\" alt=\"Image\" />', '[img]https://example.com/bild.jpg[/img]', NULL, 1, 1, 0, NULL, 0),
(7, 'code', '<pre><code>{content}</code></pre>', '[code]echo Hallo[/code]', NULL, 1, 1, 0, NULL, 0),
(8, 'quote', '<blockquote>{content}</blockquote>', '[quote]Zitat[/quote]', NULL, 1, 1, 0, NULL, 0);


--
-- Daten für Tabelle `oc_forum_categories`
--

INSERT INTO `oc_forum_categories` (`id`, `header_id`, `name`, `description`, `slug`, `sort_order`, `thread_count`, `post_count`, `created_at`, `updated_at`) VALUES
(1, 1, 'Termine', 'Abstimmungen zu Terminen', 'termine', 0, 1, 0, 1768648488, 1768648488),
(2, 1, 'Technik', 'Diskussionen zu Technikthemen', 'technik', 0, 0, 0, 1768648520, 1768648520),
(3, 1, 'Zusammenarbeit', 'Was brauchen wir für Elemente in der Nextcloud, was muss umgestellt werden, wer hat wo Probleme? Brauchen wir ein EInführungsvideo, ...', 'collab', 0, 0, 0, 1768650857, 1768650857),
(4, 1, 'Ankündigungen', 'Hier wird nicht Diskutiert', 'announce', 0, 0, 0, 1768650894, 1768650894),
(5, 1, 'Unterlagen', 'ABstimmungen zu Flyern, Webseite, Ausschreibungen etc.', 'documents', 0, 0, 0, 1768650964, 1768650964);


--
-- Daten für Tabelle `oc_forum_category_perms`
--

INSERT INTO `oc_forum_category_perms` (`id`, `category_id`, `role_id`, `can_view`, `can_post`, `can_reply`, `can_moderate`) VALUES
(1, 1, 2, 1, 1, 1, 0),
(2, 1, 3, 1, 1, 1, 0),
(3, 1, 1, 1, 1, 1, 0),
(4, 2, 2, 1, 1, 1, 0),
(5, 2, 3, 1, 1, 1, 0),
(6, 2, 1, 1, 1, 1, 0),
(7, 3, 2, 1, 1, 1, 0),
(8, 3, 3, 1, 1, 1, 0),
(9, 3, 1, 1, 1, 1, 0),
(10, 4, 2, 1, 1, 1, 0),
(11, 4, 3, 1, 1, 1, 0),
(12, 4, 1, 1, 1, 1, 0),
(13, 5, 2, 1, 1, 1, 0),
(14, 5, 3, 1, 1, 1, 0),
(15, 5, 1, 1, 1, 1, 0),
(16, 6, 2, 1, 1, 1, 0),
(17, 6, 3, 1, 1, 1, 0),
(18, 6, 1, 1, 1, 1, 0);


--
-- Daten für Tabelle `oc_forum_cat_headers`
--

INSERT INTO `oc_forum_cat_headers` (`id`, `name`, `description`, `sort_order`, `created_at`) VALUES
(1, 'Diskussionen', 'Allgemeine Diskussionen , Technik, Termine, Unterlagen und Ankündigungen', 0, 1768647182);


--
-- Daten für Tabelle `oc_forum_drafts`
--

INSERT INTO `oc_forum_drafts` (`id`, `user_id`, `entity_type`, `parent_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'thread', 2, NULL, 'Microbit umg', 1768649381, 1768649381);


--
-- Daten für Tabelle `oc_forum_posts`
--

INSERT INTO `oc_forum_posts` (`id`, `thread_id`, `author_id`, `content`, `is_edited`, `is_first_post`, `edited_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'admin', 'Erste kurse im Juli sind gut weil da kein Klausurstress mehr ist. Aber ich selbst habe im Juli leider viele Samstage schon für die Feuerwehr geblockt.', 0, 1, NULL, 1768649359, 1768649359, NULL),
(2, 2, 'admin', 'Wollen wir microbit oder scratch', 0, 1, NULL, 1768651314, 1768651314, NULL);


--
-- Daten für Tabelle `oc_forum_reactions`
--

INSERT INTO `oc_forum_reactions` (`id`, `post_id`, `user_id`, `reaction_type`, `created_at`) VALUES
(1, 2, 'admin', '👍', 1768651319);

--
-- Daten für Tabelle `oc_forum_read_markers`
--

INSERT INTO `oc_forum_read_markers` (`id`, `user_id`, `thread_id`, `last_read_post_id`, `read_at`) VALUES
(1, 'admin', 1, 1, 1768649360),
(2, 'admin', 2, 2, 1768651315),
(3, 'mintcloud', 1, 1, 1768654871);

-- --------------------------------------------------------


--
-- Daten für Tabelle `oc_forum_roles`
--

INSERT INTO `oc_forum_roles` (`id`, `name`, `description`, `can_access_admin_tools`, `can_edit_roles`, `can_edit_categories`, `created_at`, `color_light`, `color_dark`, `is_system_role`, `role_type`) VALUES
(1, 'admin', 'Die Admins', 1, 1, 1, 0, NULL, NULL, 1, 'system'),
(2, 'moderator', NULL, 1, 0, 1, 0, NULL, NULL, NULL, 'custom'),
(3, 'user', NULL, 0, 0, 0, 0, NULL, NULL, NULL, 'custom');

-- --------------------------------------------------------

--
-- Daten für Tabelle `oc_forum_threads`
--

INSERT INTO `oc_forum_threads` (`id`, `category_id`, `author_id`, `title`, `slug`, `view_count`, `post_count`, `last_post_id`, `is_locked`, `is_pinned`, `is_hidden`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'admin', 'Erste Kurse', 'erste-kurse', 3, 0, 1, 0, 0, 0, 1768649359, 1768649359, NULL),
(2, 6, 'admin', 'Test abstimmung', 'test-abstimmung', 1, 0, 2, 0, 0, 0, 1768651314, 1768651314, NULL);

-- --------------------------------------------------------

--
-- Daten für Tabelle `oc_forum_thread_subs`
--

INSERT INTO `oc_forum_thread_subs` (`id`, `user_id`, `thread_id`, `created_at`) VALUES
(1, 'admin', 1, 1768649359),
(2, 'admin', 2, 1768651314);

-- --------------------------------------------------------

--
-- Daten für Tabelle `oc_forum_users`
--

INSERT INTO `oc_forum_users` (`id`, `user_id`, `post_count`, `thread_count`, `last_post_at`, `deleted_at`, `signature`, `created_at`, `updated_at`) VALUES
(1, 'admin', 0, 2, NULL, NULL, 'Test', 1768646105, 1768651314),
(2, 'mintcloud', 0, 0, NULL, NULL, 'j', 0, 1768654704),
(3, 'maxmu', 0, 0, NULL, NULL, 'Ich [b]bins[/b] ', 1768648227, 1768648227);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

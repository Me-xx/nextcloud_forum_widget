// 🔥 Nextcloud Forum Widget - Vollständige Production-Version
(function() {
    /**
     * @param {HTMLElement} el - Dashboard Widget Container
     */
    function renderForumWidget(el) {
        // Loading State
        el.innerHTML = `
            <div class="forum-widget">
                <div class="forum-header">
                    <h3>📊 Forum Übersicht</h3>
                </div>
                <div class="forum-section">
                    <div class="section-title">Top Kategorien</div>
                    <ul id="forum-top-categories" class="forum-list">
                        <li class="loading">⏳ Lädt...</li>
                    </ul>
                </div>
                <div class="forum-section">
                    <div class="section-title">Top Threads</div>
                    <ul id="forum-top-threads" class="forum-list">
                        <li class="loading">⏳ Lädt...</li>
                    </ul>
                </div>
            </div>
        `;

        // Scoped DOM-Elemente
        const catList = el.querySelector('#forum-top-categories');
        const threadList = el.querySelector('#forum-top-threads');

        // API Call mit Timeout + Error Handling
        const controller = new AbortController();
        const timeoutId = setTimeout(() => controller.abort(), 10000); // 10s Timeout

        fetch(OC.generateUrl('/apps/forum_widget/stats'), {
            signal: controller.signal
        })
        .then(r => {
            clearTimeout(timeoutId);
            if (!r.ok) throw new Error(`HTTP ${r.status}`);
            return r.json();
        })
        .then(data => {
            console.log('✅ Forum data loaded:', data);

            // Kategorien rendern
            renderList(catList, data.categories || [], (item) => {
                const link = OC.generateUrl('/apps/forum/c/{slug}', { slug: item.slug });
                return `<a href="${link}">${item.name || 'Unbekannt'} (${item.thread_count || 0})</a>`;
            });

            // Threads rendern
            renderList(threadList, data.threads || [], (item) => {
                const link = OC.generateUrl('/apps/forum/t/{slug}', { slug: item.slug });
                return `<a href="${link}">${item.title || 'Unbekannt'} (${item.views || 0})</a>`;
            });
        })
        .catch(error => {
            console.error('❌ Forum Widget Error:', error);
            catList.innerHTML = '<li class="error">⚠️ Fehler beim Laden</li>';
            threadList.innerHTML = '<li class="error">⚠️ Fehler beim Laden</li>';
        });

        /**
         * List-Renderer Helper
         */
        function renderList(listEl, items, formatFn) {
            listEl.innerHTML = '';

            if (!items || !Array.isArray(items) || items.length === 0) {
                listEl.innerHTML = '<li class="empty">Keine Daten</li>';
                return;
            }

            items.slice(0, 5).forEach(item => { // Max 5 Items
                const li = document.createElement('li');
                li.innerHTML = formatFn(item);
                li.title = formatFn(item); // Tooltip
                listEl.appendChild(li);
            });
        }
    }

    // Dashboard API registrieren
    if (typeof OCA !== 'undefined' && OCA.Dashboard && OCA.Dashboard.register) {
        OCA.Dashboard.register('forum_widget', renderForumWidget);
        console.log('✅ Forum Widget v1.0 registered!');
    } else {
        console.warn('⚠️ Nextcloud Dashboard API nicht verfügbar');
    }
})();

module.exports = {
    globDirectory: "public/",
    globPatterns: [
        "**/*.{css,js,html,png,jpg,jpeg,svg,gif,woff2,woff,eot,ttf,ico}",
    ],
    swDest: "public/service-worker.js",
    runtimeCaching: [
        {
            urlPattern: /\.(?:png|jpg|jpeg|svg|gif|ico)$/,
            handler: "CacheFirst",
            options: {
                cacheName: "images",
                expiration: {
                    maxEntries: 50,
                    maxAgeSeconds: 30 * 24 * 60 * 60, // 30 days
                },
            },
        },
        {
            urlPattern: new RegExp("/api/.*"), // Untuk endpoint API
            handler: "StaleWhileRevalidate",
            options: {
                cacheName: "api",
                expiration: {
                    maxEntries: 50,
                    maxAgeSeconds: 7 * 24 * 60 * 60, // 7 days
                },
            },
        },
        {
            urlPattern: /\.(?:js|css)$/,
            handler: "StaleWhileRevalidate",
            options: {
                cacheName: "static-resources",
                expiration: {
                    maxEntries: 50,
                    maxAgeSeconds: 7 * 24 * 60 * 60, // 7 days
                },
            },
        },
        {
            urlPattern: new RegExp("/.*"), // Untuk rute dinamis dan tampilan
            handler: "StaleWhileRevalidate",
            options: {
                cacheName: "dynamic-pages",
                expiration: {
                    maxEntries: 50,
                    maxAgeSeconds: 7 * 24 * 60 * 60, // 7 days
                },
                cacheableResponse: {
                    statuses: [0, 200],
                },
            },
        },
    ],
};

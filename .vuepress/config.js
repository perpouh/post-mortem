module.exports = {
  title: '',
  description: '活動拠点です。',
  base: '/post-mortem/',
  dest: 'docs',
  head: [
    ['link', { rel: 'icon', type: 'image/png', href: '/assets/img/favicon.ico' }],
    ['meta', { name: "author", content: "perpouh" }]
  ],
  themeConfig: {
    logo: '/assets/img/logo.png',
    nav: [
      { text: 'GitHub', link: 'https://github.com/perpouh/post-mortem'}
    ],
    sidebar: [
      {
        title: 'インフラ',
        children: [
          ["infrastructure/Docker", "Docker"]
        ]
      },
      {
        title: 'Vue',
        children: [
          ["vue/Vueからaxiosを使ってRailsにajaxリクエストを行う", "Vueからaxiosを使ってRailsにajaxリクエストを行う"],
          ["vue/axiosとVuexを使ったログインロジックの作成", "axiosとVuexを使ったログインロジックの作成"]
        ]
      },
      {
        title: 'Rails',
        children: [
          ["rails/rack-corsを導入する", "rack-corsを導入する"],
          ["rails/devise_token_auth導入と設定", "devise_token_auth導入と設定"]
        ]
      },
    ],
    sidebarDepth: 2
  },
  plugins: [
    [
      "seo",
      {
        siteTitle: (_, $site) => $site.title,
        title: $page => $page.title,
        description: $page => $page.frontmatter.description,
        author: (_, $site) => $site.themeConfig.author,
        tags: $page => $page.frontmatter.tags,
        twitterCard: _ => 'summary_large_image',
        type: $page => ['_posts'].some(folder => $page.regularPath.startsWith('/' + folder)) ? 'article' : 'website',
        url: (_, $site, path) => ($site.themeConfig.domain || '') + path,
        image: ($page, $site) => $page.frontmatter.image && (($site.themeConfig.domain && !$page.frontmatter.image.startsWith('http') || '') + $page.frontmatter.image),
        publishedAt: $page => $page.frontmatter.date && new Date($page.frontmatter.date),
        modifiedAt: $page => $page.lastUpdated && new Date($page.lastUpdated),
      }
    ]
  ]
}
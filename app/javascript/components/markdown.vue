<template>
  <div class="content markdown-text" v-html="compiledMarkdown"></div>
</template>
<script>
import marked from 'marked'
export default {
  props: ['src'],
  computed: {
    compiledMarkdown() {
      return marked(this.src, {
        breaks: true
      })//.replace(/<a href/g, "<a target=\"_blank\" href")
    }
  }
}
</script>
<style>
.content.markdown-text {
  overflow-wrap: break-word;
  word-wrap: break-word;
  word-break: break-word;
}
.content.markdown-text li ul,
.content.markdown-text li ol {
  margin-top: 0px;
}
.content.markdown-text ul li,
.content.markdown-text ol li,
.content.markdown-text ul:first-child,
.content.markdown-text ol:first-child {
  margin-top: 0px;
}
.content.markdown-text ul:not(first-child),
.content.markdown-text ol:not(first-child) {
  margin-top: 0.5em;
}
.content.markdown-text ul:not(last-child),
.content.markdown-text ol:not(last-child),
.content.markdown-text p {
  margin-bottom: 0.5em;
}
.content.markdown-text ul:last-child,
.content.markdown-text ol:last-child,
.content.markdown-text p:last-child {
  margin-bottom: 0px;
}
.content.markdown-text h1,
.content.markdown-text h2,
.content.markdown-text h3,
.content.markdown-text h4,
.content.markdown-text h5,
.content.markdown-text h6 {
  font-size: 16px;
  line-height: 24px;
  margin-top: 0px;
  margin-bottom: 0px;
}
</style>

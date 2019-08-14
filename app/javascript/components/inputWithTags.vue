<template>
  <textarea :placeholder="this.placeholder" :name="this.name" :rows="this.rows"
    class="textarea" ref="textbox" autofocus>{{this.body}}</textarea>
</template>
<script>
import Tribute from 'tributejs'

export default {
  props: ['content', 'name', 'placeholder', 'rows'],
  data() {
    return {
      body: "",
      tribute: null
    }
  },
  methods: {
    remoteSearch(text, cb) {
      this.$http.get(`/tags?q=${text}`).then(resp => {
        cb(resp.data)
      })
    }
  },
  mounted() {
    let that = this
    this.tribute = new Tribute({
      trigger: '#',
      values: function(text, cb){
        that.remoteSearch(text, tags => cb(tags));
      },
    })
    this.tribute.attach(this.$refs.textbox)

    this.body = this.content;
  }
}
</script>

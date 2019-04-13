<template>
  <div class="about">
     <div>
     </div>
    <h1>This is an about page</h1>
    <button @click="toHome">点此进行入Home页面</button>
    <editor id='tinymce' v-model='myValue'  @onClick="onClick" :init='init'></editor>
  </div>
</template>
<script>
  import tinymce from 'tinymce/tinymce'
  import Editor from '@tinymce/tinymce-vue'
  import 'tinymce/themes/silver/theme.min'

  import 'tinymce/plugins/image'
  import 'tinymce/plugins/link'
  import 'tinymce/plugins/code'
  import 'tinymce/plugins/table'
  import 'tinymce/plugins/lists'
  import 'tinymce/plugins/contextmenu'
  import 'tinymce/plugins/wordcount'
  import 'tinymce/plugins/colorpicker'
  import 'tinymce/plugins/textcolor'
export default {
  data(){
    return {
      myValue: 'Hello World!',
      val:"",
      isKeepAlive:true,
      init: {
        language_url: '/public/tinymce/langs/zh_CN.js',
        language: 'zh_CN',
        skin_url: '/tinymce/skins/ui/oxide',  /*必須為此路徑*/
        height: 300,
        toolbar: this.toolbar,
        plugins: 'lists image  table textcolor wordcount contextmenu',
        branding: false,//是否禁用“Powered by TinyMCE”
	      menubar: true,//顶部菜单栏显示
        images_upload_handler: (blobInfo, success, failure) => {
          const img = 'data:image/jpeg;base64,' + blobInfo.base64()
          success(img)
        },
        myValue: this.value
      },
      tinymceHtml: '请输入内容',
    }
  },
  props: {
    //传入一个value，使组件支持v-model绑定
    value: {
      type: String,
      default: ''
    },
    disabled: {
      type: Boolean,
      default: false
    },
    plugins: {
      type: [String, Array],
      default: 'lists image media table textcolor wordcount contextmenu'
    },
    toolbar: {
      type: [String, Array],
      default: 'undo redo |  formatselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | lists image media table | removeformat'
    }
  },
  components: {
    Editor
  },
  methods:{
    toHome(){
      var first  = this.val;
      this.$router.push("/home");
    },
    onClick(e) {
      this.$emit('onClick', e, tinymce)
    },
    //可以添加一些自己的自定义事件，如清空内容
    clear() {
      this.myValue = ''
    }
  },
  watch: {
    value(newValue) {
      this.myValue = newValue
    },
    myValue(newValue) {
      this.$emit('input', newValue)
    }
  },
  mounted(){
    tinymce.init({})
  },
}
</script>


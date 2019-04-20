使用active-text属性与inactive-text属性来设置开关的文字描述。
<template>
  <el-switch
  v-model="value3"
  active-text="按月付费"
  inactive-text="按年付费">
  </el-switch>
  <el-switch
    style="display: block"
    v-model="value4"
    active-color="#13ce66"
    inactive-color="#ff4949"
    active-text="按月付费"
    inactive-text="按年付费">
  </el-switch>
</template>

<script>
  export default {
    data() {
      return {
        value3: true,
        value4: true
      }
    }
  };
</script>
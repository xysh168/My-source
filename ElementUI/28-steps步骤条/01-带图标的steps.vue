通过icon属性来设置图标，图标的类型可以参考 Icon 组件的文档，除此以外，还能通过具名slot来使用自定义的图标。


<el-steps :active="1">
  <el-step title="步骤 1" icon="el-icon-edit"></el-step>
  <el-step title="步骤 2" icon="el-icon-upload"></el-step>
  <el-step title="步骤 3" icon="el-icon-picture"></el-step>
</el-steps>
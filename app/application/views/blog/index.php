<h1>Blog Entries</h1>

<table>
  <tr>
    <th>Date</th>
    <th>Title</th>
  </tr>
  <tbody>
  <?php foreach ($blogs as $blog) { 
    echo "<tr>
      <td>{$blog->created_at}</td>
      <td><a href=\"/blog/show/{$blog->id}\">{$blog->title}</a></td>
      </tr>";
  }
  ?>
  </tbody>
</table>

<a href="/blog/new">Create New Entry</a>
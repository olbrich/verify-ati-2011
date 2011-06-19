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

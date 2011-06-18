<table>
  <tr>
    <th>Date</th>
    <th>Title</th>
  </tr>
  <tbody>
  <?php foreach ($blogs as $blog) { 
    echo "<tr>
      <td>{$blog->created_at}</td>
      <td>{$blog->title}</td>
      </tr>";
  }
  ?>
  </tbody>
</table>

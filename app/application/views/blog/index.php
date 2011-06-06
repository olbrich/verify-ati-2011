<table>
  <th>
    <td>Date</td>
    <td>Title</td>
  </th>
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

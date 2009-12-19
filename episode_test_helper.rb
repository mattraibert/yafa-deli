module EpisodeTestHelper
  def one_hour_episode_html
    %Q(<tr>
    <td class="c1 ntb"></td>
    <td class="c2 ">1:00am</td>
    <td class="c3 "> <a href="wzbc-2009-12-18-01-00.m3u">Listen</a></td>
    <td class="c3" rowspan="2"><b>The Jam Session </b></td>
  </tr>)
  end
  
  def one_hour_episode_extra_anchor_html
    %Q(<tr>
    <td class="c1 ntb"></td>
    <td class="c2 ">1:00am</td>
    <td class="c3 "> <a href="wzbc-2009-12-18-01-00.m3u">Listen</a></td>
    <td class="c3" rowspan="2"><b>The Jam Session </b><a href="http://www.google.com">google</a></td>
  </tr>)
  end
  
  def two_hour_episode_html
    %Q(<tr>
    <td class="c1 ntb"></td>
    <td class="c2 ">12:00am</td>
    <td class="c3 "> <a href="wzbc-2009-12-19-00-00.m3u">Listen</a></td>
    <td class="c3" rowspan="1"><b>Forward the Bass</b></td>
  </tr>
  <tr>
    <td class="c1 ntb"></td>
    <td class="c2 ">6:00am</td>
    <td class="c3 "> <a href="wzbc-2009-12-19-06-00.m3u">Listen</a></td>
    <td class="c3" rowspan="1"></td>
  </tr>)
  end
end

{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-03.jpg');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Classes</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">Classes</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->

    <!-- CLASS SCHEDULE-->
    <section class="section p-t-125 p-b-90">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading section-heading-1 m-b-35">
                        <h2 class="section-heading__title">Classes Schedule</h2>
                        <div class="section-heading__line">
                            <img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
                        </div>
                    </div>
                    <div class="wrap wrap--w830">
                        <p class="text-center">
                            Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
                            sit aspernatur aut odit aut fugit, sed quia consequuntur.
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="au-tab-3-wrap p-t-60">
                        <nav class="au-tab-3 m-b-50">
                            <ul class="nav list-unstyled au-tab__nav au-tab__nav--sspace" role="tablist">
                                <li class="au-tab__nav-item">
                                    <a class="active" href="#all" data-toggle="tab" aria-controls="all" aria-selected="true" role="tab">
                                        <span class="au-tab__nav-item-inner">All</span>
                                    </a>
                                </li>
                                <li class="au-tab__nav-item">
                                    <a href="#art" data-toggle="tab" aria-controls="art" aria-selected="false" role="tab">
                                        <span class="au-tab__nav-item-inner">Art</span>
                                    </a>
                                </li>
                                <li class="au-tab__nav-item">
                                    <a href="#color" data-toggle="tab" aria-controls="color" aria-selected="false" role="tab">
                                        <span class="au-tab__nav-item-inner">Color</span>
                                    </a>
                                </li>
                                <li class="au-tab__nav-item">
                                    <a href="#cre" data-toggle="tab" aria-controls="cre" aria-selected="false" role="tab">
                                        <span class="au-tab__nav-item-inner">Creative</span>
                                    </a>
                                </li>
                                <li class="au-tab__nav-item">
                                    <a href="#basic" data-toggle="tab" aria-controls="basic" aria-selected="false" role="tab">
                                        <span class="au-tab__nav-item-inner">Basic Skills</span>
                                    </a>
                                </li>
                                <li class="au-tab__nav-item">
                                    <a href="#music" data-toggle="tab" aria-controls="music" aria-selected="false" role="tab">
                                        <span class="au-tab__nav-item-inner">Music</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                        <div class="tab-content au-tab-content-2">
                            <div class="tab-pane au-tab-pane-2 fade show active" role="tabpanel" id="all">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">january 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane au-tab-pane-2 fade" role="tabpanel" id="art">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">february 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane au-tab-pane-2 fade" role="tabpanel" id="color">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">march 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane au-tab-pane-2 fade" role="tabpanel" id="cre">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">april 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane au-tab-pane-2 fade" role="tabpanel" id="basic">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">may 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane au-tab-pane-2 fade" role="tabpanel" id="music">
                                <table class="table table-schedule">
                                    <thead>
                                    <tr>
                                        <th class="table-schedule-th-1" colspan="7">
                                            <div class="table-schedule-th-1__inner">
                                                <a class="arrow prev" href="#">
                                                    <span class="lnr lnr-arrow-left"></span>
                                                </a>
                                                <a class="arrow next" href="#">
                                                    <span class="lnr lnr-arrow-right"></span>
                                                </a>
                                                <div class="title title--lg title--white text-uppercase">june 2018</div>
                                            </div>
                                        </th>
                                    </tr>
                                    <tr class="table-schedule-th-2">
                                        <th>Time</th>
                                        <th>Monday</th>
                                        <th>Tuesday</th>
                                        <th>Wednesday</th>
                                        <th>Thursday</th>
                                        <th>Friday</th>
                                        <th>Saturday</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>08:00</td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>09:00</td>
                                    </tr>
                                    <tr>
                                        <td>10:00</td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>11:00</td>
                                    </tr>
                                    <tr>
                                        <td>12:00</td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue2" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">12:00 - 14:00</span>
                                                <h5 class="title title--white">Eat and Sleep</h5>
                                                <p class="text">Ensure nutrition and health for children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>13:00</td>
                                    </tr>
                                    <tr>
                                        <td>14:00</td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap green" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Music Classes</h5>
                                                <p class="text">Learn to sing with the teacher</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>15:00</td>
                                    </tr>
                                    <tr>
                                        <td>16:00</td>
                                        <td class="table-schedule-item-wrap blue" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Color Classes</h5>
                                                <p class="text">Learn about colors around children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap yellow" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Creative Classes</h5>
                                                <p class="text">Create the new fifth children</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap violet" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Art Classes</h5>
                                                <p class="text">Teaching kids to express their creativity</p>
                                            </div>
                                        </td>
                                        <td class="table-schedule-item-wrap pink" rowspan="2">
                                            <div class="table-schedule-item">
                                                <span class="time">08:00 - 10:00</span>
                                                <h5 class="title title--white">Basic Skills</h5>
                                                <p class="text">This should know every child</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>17:00</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="table-schedule--small">
                                    <h3 class="title title--md">Monday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Tuesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Wednesday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Thursday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Friday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                    <h3 class="title title--md">Saturday</h3>
                                    <ul class="list-schedule list-unstyled">
                                        <li class="list-schedule__item">
                                            <div class="event">Art Classes</div>
                                            <div class="time">08:00 - 10:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Creative Classes</div>
                                            <div class="time">10:00 - 12:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Eat and Sleep</div>
                                            <div class="time">12:00 - 14:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Basic Skills</div>
                                            <div class="time">14:00 - 16:00</div>
                                        </li>
                                        <li class="list-schedule__item">
                                            <div class="event">Color Classes</div>
                                            <div class="time">16:00 - 18:00</div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END CLASS SCHEDULE-->

    <!-- CTA-->
    <section class="section cta-1 bg-pink p-t-80 p-b-55">
        <div class="container">
            <div class="cta-wrap">
                <div class="cta__img wow fadeInUp" data-wow-delay=".2s">
                    <img src="/assets/jobby/images/cta-item-01.png" alt="CTA">
                </div>
                <div class="row">
                    <div class="col-md-7 offset-md-5">
                        <div class="wrap--w625">
                            <div class="cta">
                                <div class="cta__body">
                                    <h2 class="title cta__title">How to Enroll Your Child to a Class?</h2>
                                    <p class="cta__text">Interested in good preschool education for your child? Our kindergarten is the right decision!</p>
                                    <a class="au-btn au-btn--blue" href="#">find our more
                                        <i class="zmdi zmdi-chevron-right"></i>
                                        <i class="zmdi zmdi-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END CTA-->
{/block}

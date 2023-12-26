<!DOCTYPE html>
<html>
<style>
    * {
        margin: 0;
        padding: 0;
        color: #ffffff;
    }

    html,
    body {
        margin: 0;
        padding: 0;
    }

    body {
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #0b1e48;
        width: 100%;
        box-sizing: border-box;
        padding: 20px 0 50px 0;
    }

    /* 定义浏览器下拉条样式 */
    body::-webkit-scrollbar {
        width: 6px;
        height: 6px;
    }

    body::-webkit-scrollbar-button {
        display: none;
    }

    body::-webkit-scrollbar-track {
        background-color: #304156;
    }

    body::-webkit-scrollbar-track-piece {
        background: #ffffff;
    }

    body::-webkit-scrollbar-thumb {
        background-color: #8e8e8e;
        border-radius: 3px;
    }

    body::-webkit-scrollbar-thumb:hover {
        background-color: #3b3b3b;
    }

    body::-webkit-scrollbar-resizer {
        background-color: #fff;
    }

    h2.section {
        font-family: sans-serif;
        font-size: 28px;
        color: #FFFFFF;
        margin: 30px 0 12px;
    }

    table {
        min-width: 600px;
        width: 70%;
        border-collapse: collapse;
        border-color: grey;
        font-family: sans-serif;
    }

    td.header {
        padding: 18px;
        border: 1px solid #ccc;
        font-size: 18px;
        color: #fff;
    }

    td.odd {
        padding: 10px;
        border: 1px solid #ccc;
        font-size: 16px;
        color: rgb(255, 255, 255);
    }

    td.even {
        padding: 10px;
        border: 1px solid #ccc;
        font-size: 16px;
        color: rgb(220, 220, 220);
    }

    tr.header {
        background-color: rgba(64, 64, 64, 0.75);
    }

    tr.odd {
        background-color: rgba(0, 0, 0, 0.6);
    }

    tr.even {
        background-color: rgba(0, 0, 0, 0.7);
    }
</style>

<body>
    <?php
    error_reporting(E_ALL);
    ini_set('display_errors', 1);

    echo '<h2 class="section"><center>版本信息</center></h2>';
    echo '<table align="center">';
    echo '<tbody>';
    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd">php 版本</td>';
    echo '<td class="odd">', PHP_VERSION, '</td>';
    echo '</tr>';
    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd">nginx 版本</td>';
    echo '<td class="odd">', $_SERVER['SERVER_SOFTWARE'], '</td>';
    echo '</tr>';
    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd">mysql 服务器版本</td>';
    echo '<td class="odd">', getMysqlVersion(), '</td>';
    echo '</tr>';

    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd">redis 服务器版本</td>';
    echo '<td class="odd">', getRedisVersion(), '</td>';
    echo '</tr>';

    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd"> php 单个上传文件的最大大小</td>';
    echo '<td class="odd">', ini_get('upload_max_filesize'), '</td>';
    echo '</tr>';
    echo '<tr class="odd" style="display: table-row;">';
    echo '<td class="odd"> php 上传文件的最大总大小</td>';
    echo '<td class="odd">', ini_get('post_max_size'), '</td>';
    echo '</tr>';

    echo '</tbody>';
    echo '</table>';

    echo '<h2 class="section"><center>已安装扩展</center></h2>';
    printExtensions();

    echo '</body>';

    /**
     * 获取MySQL版本
     */
    function getMysqlVersion()
    {
        if (extension_loaded('PDO_MYSQL')) {
            try {
                $dbh = new PDO('mysql:host=mysql;dbname=holovision', 'holovision', 'holovision2023');
                $sth = $dbh->query('SELECT VERSION() as version');
                $info = $sth->fetch();
            } catch (PDOException $e) {
                return $e->getMessage();
            }
            return $info['version'];
        } else {
            return 'pdo_mysql 扩展未安装 ×';
        }
    }

    /**
     * 获取Redis版本
     */
    function getRedisVersion()
    {
        if (extension_loaded('redis')) {
            try {
                $redis = new Redis();
                $redis->connect('redis', 6379);
                $redis->auth('holovision2023');
                $info = $redis->info();
                return $info['redis_version'];
            } catch (Exception $e) {
                return $e->getMessage() . ' 111';
            }
        } else {
            return 'redis 扩展未安装';
        }
    }

    /**
     * 获取已安装扩展列表
     */
    function printExtensions()
    {
        echo '<table align="center">';
        echo '<tbody>';
        foreach (get_loaded_extensions() as $i => $name) {
            echo '<tr class="odd" style="display: table-row;">';
            echo '<td class="odd">', ($i + 1) . '. ' . $name, '</td>';
            echo '<td class="odd">', phpversion($name), '</td>';
            echo '</tr>';
        }
        echo '</tbody>';
        echo '</table>';
    }
    ?>

</html>
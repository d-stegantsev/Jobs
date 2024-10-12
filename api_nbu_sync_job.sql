BEGIN
    sys.dbms_scheduler.create_job(job_name        => 'api_nbu_sync_job',
                                  job_type        => 'PLSQL_BLOCK',
                                  job_action      => 'BEGIN util.api_nbu_sync; END;',
                                  start_date      => SYSDATE,
                                  repeat_interval => 'FREQ=DAILY;BYHOUR=06;BYMINUTE=00',
                                  end_date        => TO_DATE(NULL),
                                  job_class       => 'DEFAULT_JOB_CLASS',
                                  enabled         => TRUE,
                                  auto_drop       => FALSE,
                                  comments        => 'Синхронізація даних валют з API НБУ в таблицю cur_exchange');
END;
/

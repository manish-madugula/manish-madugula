INSERT INTO public.gen2_deployment
(deployment_id, comparison_id, project_id, user_id, container_id, processor, accelerator,
 create_time, update_time, is_terminated, terminate_timestamp, compute, cpu, gen, variant, application_id, helm_id)
VALUES('8a0380fb79185dd6017921ef5587000b', 'f9535cd2-83af-4548-8f6c-e114ddb4c96b', 1658, 2325, 1654, 'I7', 'GPU',
 '2021-04-30 08:40:03.000', '2021-04-30 08:40:03.000', false, NULL, 'cpu', 'core', 'gen9', 'i7', NULL, NULL);

INSERT INTO public.gen2_pod_status
(id, comparison_id, deployment_id, image_name, pod_id, pod_ip, pod_name, status, user_name, user_id, start_time, updation_time, deployment_name, create_time)
VALUES(12144, 'f9535cd2-83af-4548-8f6c-e114ddb4c96b', '8a0380fb79185dd6017921ef5587000b', 'quay.io/devcloud/object-detection:2021.2', '6ce11a8a-17fb-4c5e-ae7a-a2b78a4b6b94',
 '10.131.0.223', 'sudhanshxpaldeployment1619772003765-77b7cf57c4-dbjxr', 'RUNNING', 'sudhanshxpal', 2325, '2021-04-30 09:40:03.000', '2021-04-30 09:40:08.000',
  'sudhanshxpaldeployment1619772003763', '2021-04-30 09:40:09.000');



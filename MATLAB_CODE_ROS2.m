%% Conexión con el nodo maestro de ROS2
ros2node = ros2node('/turtle_sim_node');
% Creación del publicador en ROS2
velPub = ros2publisher(ros2node, '/turtle1/cmd_vel', 'geometry_msgs/Twist');
% Creación del mensaje en ROS2
velMsg = ros2message(velPub);
% Configuración del valor del mensaje
velMsg.linear.x = 1.0;
% Envío del mensaje
send(velPub, velMsg);
% Pausa de 1 segundo
pause(1);
%% Suscribirse al tópico de posición de turtle1
node = ros2node('/matlab_subscriber_node');

% Creación del suscriptor para el tópico '/turtle1/pose' con el tipo de mensaje 'turtlesim/Pose'
poseSub = ros2subscriber(node, '/turtle1/pose', 'turtlesim/Pose');

% Obtener el último mensaje publicado en el tópico de posición
pause(2);

% Captura el último mensaje recibido
latestPose = poseSub.LatestMessage;

% Muestra los datos de la pose
disp('Última pose de turtle1:');
disp(['X: ', num2str(latestPose.X)]);
disp(['Y: ', num2str(latestPose.Y)]);
disp(['Theta: ', num2str(latestPose.Theta)]);
disp(['Linear Velocity: ', num2str(latestPose.LinearVelocity)]);
disp(['Angular Velocity: ',num2str(latestPose.AngularVelocity)]);
%% Teletransportar la tortuga a una nueva posición
node = ros2node('turtle_teleport_node'); % Crear nodo en ROS2
client = ros2client(node, '/turtle1/teleport_absolute', 'turtlesim/srv/TeleportAbsolute'); % Cliente del servicio de teletransporte

% Crear mensaje de solicitud
req = ros2message(client);

% Definir la nueva posición y orientación
req.X = 5.0; % Coordenada X
req.Y = 5.0; % Coordenada Y
req.Theta = pi/2; % Orientación en 90 grados

% Enviar el mensaje al servicio
call(client, req);

USE [321_Sludanov_Daniil_Service]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[position] [varchar](100) NULL,
	[specialization] [varchar](100) NULL,
	[contact_info] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_type_id] [int] NULL,
	[serial_number] [varchar](100) NOT NULL,
	[description] [text] NULL,
	[last_repair_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment_Type]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment_Type](
	[equipment_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](100) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monitoring_And_Analysis]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monitoring_And_Analysis](
	[analysis_id] [int] IDENTITY(1,1) NOT NULL,
	[request_id] [int] NULL,
	[processing_time] [time](7) NULL,
	[work_quality] [varchar](50) NULL,
	[production_cost] [decimal](10, 2) NULL,
	[analysis_date] [date] NULL,
	[recommendations] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[analysis_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[request_id] [int] NULL,
	[creation_date] [date] NULL,
	[work_description] [text] NULL,
	[fault_reasons] [text] NULL,
	[used_resources] [text] NULL,
	[work_quality] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[request_id] [int] IDENTITY(1,1) NOT NULL,
	[equipment_type_id] [int] NULL,
	[status_id] [int] NULL,
	[serial_number] [varchar](100) NOT NULL,
	[problem_description] [text] NULL,
	[creation_date] [date] NOT NULL,
	[priority] [int] NULL,
	[responsible_employee_id] [int] NULL,
	[client] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Execution]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Execution](
	[execution_id] [int] IDENTITY(1,1) NOT NULL,
	[request_id] [int] NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
	[executor_id] [int] NULL,
	[work_description] [text] NULL,
	[used_materials] [text] NULL,
	[cost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[execution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Status]    Script Date: 06.11.24 15:11:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Status](
	[status_id] [int] IDENTITY(1,1) NOT NULL,
	[status_name] [varchar](50) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[status_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([equipment_type_id])
REFERENCES [dbo].[Equipment_Type] ([equipment_type_id])
GO
ALTER TABLE [dbo].[Monitoring_And_Analysis]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[Request] ([request_id])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[Request] ([request_id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([equipment_type_id])
REFERENCES [dbo].[Equipment_Type] ([equipment_type_id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([responsible_employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([status_id])
REFERENCES [dbo].[Request_Status] ([status_id])
GO
ALTER TABLE [dbo].[Request_Execution]  WITH CHECK ADD FOREIGN KEY([executor_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Request_Execution]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[Request] ([request_id])
GO

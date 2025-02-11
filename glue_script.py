import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize Glue job parameters
args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

data = [(1, "Alice"), (2, "Bob"), (3, "Charlie")]
columns = ["id", "name"]
df = spark.createDataFrame(data, columns)

# Print schema of the DataFrame
df.printSchema()

# Show DataFrame contents
df.show()

# Commit the job
job.commit()

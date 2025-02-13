sed -i 's|exec "${SPARK_HOME}"/bin/spark-submit pyspark-shell-main --name "PySparkShell" "$@"|exec "${SPARK_HOME}"/bin/spark-submit "$@" pyspark-shell-main|' "$(which pyspark)"

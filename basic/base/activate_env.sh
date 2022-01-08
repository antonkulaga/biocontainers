# Initialize the current shell
eval "$(MAMBA_ROOT_PREFIX=/_invalid "${MAMBA_EXE}" shell hook --shell=bash)"
# ugly temporary workaround for <https://github.com/mamba-org/mamba/issues/1322>.

# For robustness, try all possible activate commands.
conda activate "${ENV_NAME}" 2>/dev/null \
  || mamba activate "${ENV_NAME}" 2>/dev/null \
  || micromamba activate "${ENV_NAME}"